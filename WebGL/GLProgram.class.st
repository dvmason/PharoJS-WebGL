"
I represent WebGL programs
"
Class {
	#name : #GLProgram,
	#superclass : #Object,
	#instVars : [
		'varyings',
		'currentProgramName',
		'defaultProgram',
		'attributes',
		'uniforms',
		'shaderProgram',
		'references',
		'classes',
		'webGL',
		'bufferType',
		'buffers',
		'suffix',
		'context'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Programs'
}

{ #category : #textures }
GLProgram >> activeTexture: key [
	webGL log: 'activeTexture:'.
	^ webGL activeTexture: key
]

{ #category : #accessing }
GLProgram >> addObject: aGlObject [
	aGlObject program: self.
	self initializeStatic: aGlObject.
	(classes at: aGlObject class name ifAbsentPut: [ OrderedCollection new ]) add: aGlObject.

]

{ #category : #buffers }
GLProgram >> arrayBuffer: name [
	bufferType := ARRAY_BUFFER.
	webGL log: 'bindBuffer:'.
	webGL bindBuffer: bufferType buffer: (buffers at: name).

]

{ #category : #textures }
GLProgram >> bindTexture: kind with: texture [
	webGL log: 'bindTexture:'.
	^ webGL bindTexture: kind with: texture
]

{ #category : #shaders }
GLProgram >> compileShaderInContext: aShader [
	^ aShader compileWithGL: webGL andVarying: varyings.

]

{ #category : #buffers }
GLProgram >> createBuffer: name then: aBlock [
	| buffer |
	(buffers includesKey: name)
		ifTrue: [ self error: 'Buffer ',name,' already created' ].
	webGL log: 'createBuffer'.
	buffer := webGL createBuffer.
	buffers at: name put: buffer.
	aBlock value: buffer
]

{ #category : #'webgl-methods' }
GLProgram >> drawArrays: type offset: offset vertexCount: count [
	webGL log: 'drawArrays:'.
	webGL drawArrays: type offset: offset vertexCount: count.

]

{ #category : #shaders }
GLProgram >> drawDelta: secondsSinceLastDraw total: secondsSinceProgramStart camera: camera [
	webGL log: 'useProgram:'.
	webGL useProgram: shaderProgram.
	self uniformMatrix4fv: #uProjectionMatrix matrix: camera cameraTransform.
	classes valuesDo: [: instances |
		instances first class setupForDraw: self.
		console log: instances first class.
		instances do: [: instance |
			instance drawDelta: secondsSinceLastDraw total: secondsSinceProgramStart.
	]].

]

{ #category : #'webgl-methods' }
GLProgram >> drawElements: drawOp vertexCount: count type: type offset: offset [
	webGL log: 'drawElements:'.
	webGL drawElements: drawOp vertexCount: count type: type offset: offset.

]

{ #category : #buffers }
GLProgram >> elementArrayBuffer: name [
	bufferType := ELEMENT_ARRAY_BUFFER.
	webGL log: 'bindBuffer:'.
	webGL bindBuffer: bufferType buffer: (buffers at: name).

]

{ #category : #textures }
GLProgram >> emptyTexture [
	| texture |
	webGL log: 'createTexture'.
  texture := webGL createTexture.
	webGL log: 'bindTexture:'.
  webGL bindTexture: TEXTURE_2D with: texture.

  " Because images have to be download over the internet
    they might take a moment until they are ready.
    Until then put a single pixel in the texture so we can
    use it immediately. When the image has finished downloading
    we'll update the texture with the contents of the image. "
	webGL log: 'texImage2D:'.
  webGL texImage2D: TEXTURE_2D
		level: 0
		internalFormat: RGBA
		width: 1
		height: 1
		border: 0
		srcFormat: RGBA
		srcType: UNSIGNED_BYTE
		pixel: (Uint8Array new: #(0 0 255 255) " opaque blue").
  ^ texture

]

{ #category : #'webgl-methods' }
GLProgram >> enableVertexAttribArray: position [
	webGL log: 'enableVertexAttribArray:'.
	webGL enableVertexAttribArray: (self ref: position).
]

{ #category : #buffers }
GLProgram >> fillBuffer: positions [
	webGL log: 'bufferData:'.
	webGL bufferData: bufferType buffer: ((bufferType = ARRAY_BUFFER ifTrue: [Float32Array] ifFalse: [Uint16Array]) new: positions) kind: STATIC_DRAW.

]

{ #category : #shaders }
GLProgram >> fragmentShader: aBlock [
	| shader |
	shader := GLFragmentShader new suffix: suffix varyings: varyings.
	aBlock value: shader.
	attributes addAll: shader attributes keys.
	uniforms addAll: shader uniforms keys.
	webGL attachShader: shaderProgram shader: (self compileShaderInContext: shader).
	webGL log: 'attachShader:'.

]

{ #category : #initialization }
GLProgram >> initialize [
	super initialize.
	classes := Dictionary new.
	buffers := Dictionary new.
	references := Dictionary new.
	varyings := Dictionary new.
	attributes := OrderedCollection new.
	uniforms := OrderedCollection new.

]

{ #category : #accessing }
GLProgram >> initializeStatic: aGlObject [
	aGlObject initializeStatic.

]

{ #category : #accessing }
GLProgram >> isEmpty [
	^ classes isEmpty
]

{ #category : #shaders }
GLProgram >> linkProgram [
	| loc |
	webGL log: 'linkProgram:'.
	webGL linkProgram: shaderProgram.
	(webGL getProgramParameter: shaderProgram parameter: LINK_STATUS) ifFalse: [
		^ self error: 'An error occurred compiling the shaders: ',(webGL getProgramInfoLog: shaderProgram)
	].
	attributes do: [: name |
		loc := webGL getAttribLocation: shaderProgram named: name,suffix.
		references at: name put: loc.
	].
	uniforms do: [: name |
		loc := webGL getUniformLocation: shaderProgram named: name,suffix.
		references at: name put: loc.
	].

]

{ #category : #textures }
GLProgram >> loadTexture: url [
	| texture image |
	texture := self emptyTexture.
	image := Image new.
	image addEventListener: #load block: [
		webGL log: 'bindTexture:'.
		webGL
			bindTexture: TEXTURE_2D with: texture;
    		texImage2D: TEXTURE_2D
				level: 0
				internalFormat: RGBA
				srcFormat: RGBA
				srcType: UNSIGNED_BYTE
				image: image.

    " WebGL1 has different requirements for power of 2 images
      vs non power of 2 images so check if the image is a
      power of 2 in both dimensions. "
    (context webGLVersion > 1 or: [image width isPowerOfTwo & image height isPowerOfTwo]) ifTrue: [
       webGL generateMipmap: TEXTURE_2D.
    ] ifFalse: [
       " No, it's not a power of 2. Turn off mips and set wrapping to clamp to edge "
       webGL texParameteri: TEXTURE_2D at: TEXTURE_WRAP_S put: CLAMP_TO_EDGE.
       webGL texParameteri: TEXTURE_2D at: TEXTURE_WRAP_T put: CLAMP_TO_EDGE.
       webGL texParameteri: TEXTURE_2D at: TEXTURE_MIN_FILTER put: LINEAR.
    ]
  ].
  image src: url.

  ^ texture

]

{ #category : #buffers }
GLProgram >> point: position at: buffer components: n [
	| pos |
	console log: position with: references.
	pos := self ref: position.
	self arrayBuffer: buffer.
	webGL log: 'vertexAttribPointer:',position.
	webGL vertexAttribPointer: pos
		numComponents: n
		type: FLOAT
		normalize: false
		stride: 0
		offset: 0.
	webGL log: 'enableVertexAttribArray:'.
	webGL enableVertexAttribArray: pos.

]

{ #category : #accessing }
GLProgram >> program [
	^ shaderProgram.

]

{ #category : #shaders }
GLProgram >> programClass: aClass [
	aClass createProgram: self.
	aClass initializeProgram: self.

]

{ #category : #accessing }
GLProgram >> ref: position [
	^ position isString ifTrue: [ references at: position ] ifFalse: [ position ]
]

{ #category : #accessing }
GLProgram >> removeObject: aGlObject [
	classes at: aGlObject class name ifPresent: [ : instances |
		instances removeObject: aGlObject.
		instances isEmpty ifTrue: [
			classes remove: aGlObject class name ifAbsent: []].
	].

]

{ #category : #shaders }
GLProgram >> shaderProgram: aSP webGL: aWGL context: aWFLC [
	shaderProgram := aSP.
	webGL := aWGL.
	context := aWFLC.

]

{ #category : #accessing }
GLProgram >> suffix: aString [ 
	suffix := aString.

]

{ #category : #'webgl-methods' }
GLProgram >> uniformMatrix4fv: position matrix: matrix [
	webGL log: 'uniformMatrix4fv: ', position asString.
	console log: matrix.
	webGL uniformMatrix4fv: (self ref: position)
		transpose: false
		matrix: matrix.
]

{ #category : #'webgl-methods' }
GLProgram >> uniformiAt: position put: value [
	webGL log: 'uniform1i:'.
	webGL uniform1i: (self ref: position) put: value
]

{ #category : #shaders }
GLProgram >> useProgram [
	webGL log: 'useProgram:'.
	webGL useProgram: shaderProgram.

]

{ #category : #shaders }
GLProgram >> varying: type named: name [ 
	varyings at: name put: type asGLType.
 
]

{ #category : #shaders }
GLProgram >> vertexShader: aBlock [
	| shader |
	shader := GLVertexShader new suffix: suffix varyings: varyings.
	aBlock value: shader.
	attributes addAll: shader attributes keys.
	uniforms addAll: shader uniforms keys.
	webGL attachShader: shaderProgram shader: (self compileShaderInContext: shader).
	webGL log: 'attachShader:'.

]
