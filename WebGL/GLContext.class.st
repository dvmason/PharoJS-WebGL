"
I represent a WebGL context.

I render on a HTML Canvas - by default, called ""glCanvas""
"
Class {
	#name : #GLContext,
	#superclass : #Object,
	#instVars : [
		'webGLVersion',
		'camera',
		'fps',
		'programs',
		'webGL'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #'webgl-methods' }
GLContext class >> attachShader: program shader: shader [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> bindBuffer: type buffer: buffer [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> bindTexture: notused with: unused [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> bufferData: type buffer: buffer kind: kind [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> clear: bits [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> clearColor: r green: g blue: b alpha: a [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> clearDepth: aNumber [
	<pharoJsSkip>

]

{ #category : #'dom-methods' }
GLContext class >> clientHeight [
	<pharoJsSkip>

]

{ #category : #'dom-methods' }
GLContext class >> clientWidth [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> compileShader: shader [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> createBuffer [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> createProgram: anObject [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> createShader: type [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> deleteShader: shader [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> depthFunc: flag [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> drawArrays: type offset: offset vertexCount: count [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> drawingBufferHeight [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> drawingBufferWidth [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> enable: flag [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> enableVertexAttribArray: position [
	<pharoJsSkip>

]

{ #category : #'instance creation' }
GLContext class >> fromCanvas: canvas [
	console log: (GLFloat32Array x: 1 y: 2 z: 4).
	^ super new fromCanvas: canvas
]

{ #category : #'webgl-methods' }
GLContext class >> generateMipmap: unused [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getAttribLocation: program named: aString [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getContext: aString [
	<pharoJsSkip>

]

{ #category : #'dom-methods' }
GLContext class >> getElementById: selector [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getProgramInfoLog: program [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getProgramParameter: program parameter: parameter [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getShaderInfoLog: program [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getShaderParameter: program parameter: parameter [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> getUniformLocation: program named: aString [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> linkProgram: program [
	<pharoJsSkip>

]

{ #category : #'instance creation' }
GLContext class >> new [
	^ self fromCanvas: #glCanvas
]

{ #category : #'glmatrix-methods' }
GLContext class >> perspective: radians
		aspect: ratio
		near: aNumber
		far: anotherNumber
		result: projectionMatrix [
	<pharoJsSkip>

]

{ #category : #'glmatrix-methods' }
GLContext class >> perspective: result
		fieldOfView: radians
		aspect: ratio
		near: aNumber
		far: anotherNumber [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> requestAnimationFrame: func [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> rotate: toMatrix
	from: fromMatrix
	rotation: rotation
	axis: axis [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> shaderSource: shader source: source [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> texImage2D: u1
			level: u2
			internalFormat: u3
			srcFormat: u4
			srcType: u5
			image: u6 [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> texImage2D: u1
		level: u2
		internalFormat: u3
		width: u4
		height: u5
		border: u6
		srcFormat: u7
		srcType: u8
		pixel: u9 [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> texParameteri: kind at: key put: value [
	<pharoJsSkip>

]

{ #category : #'glmatrix-methods' }
GLContext class >> translate: toMat4 from: fromMat4 translation: anArray [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> uniform1i: position put: value [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> uniformMatrix4fv: position transpose: bool matrix: matrix [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> useProgram: program [
	<pharoJsSkip>

]

{ #category : #'webgl-methods' }
GLContext class >> vertexAttribPointer: position numComponents: n type: type normalize: bool stride: stride offset: offset [
	<pharoJsSkip>

]

{ #category : #textures }
GLContext >> activeTexture: key [
	^ webGL activeTexture: key
]

{ #category : #rendering }
GLContext >> addObject: aGlObject [
	aGlObject gl: self.
	(programs add: aGlObject program) addObject: aGlObject
]

{ #category : #rendering }
GLContext >> animate [
	| then render total |
	render := then := nil.
	total := 0.
	render := [: now | | deltaTime |
		deltaTime := 0.001*(now - then).
		fps := 1.0 / deltaTime.
		then := now.
		self clear.
		total := total + deltaTime.
		programs do: [ : aGLProgram |
				aGLProgram drawDelta: deltaTime total: total.
		].
		window requestAnimationFrame: render.
	].
	window requestAnimationFrame: [: now | then := now. render value: now].

]

{ #category : #accessing }
GLContext >> aspect [
	^ webGL drawingBufferWidth / webGL drawingBufferHeight
]

{ #category : #shaders }
GLContext >> attachShader: program shader: shader [
	^ webGL attachShader: program shader: shader
]

{ #category : #textures }
GLContext >> bindTexture: kind with: texture [
	^ webGL bindTexture: kind with: texture
]

{ #category : #initialization }
GLContext >> camera [
	^ camera ifNil: [ camera := GLCamera new gl: self ]
]

{ #category : #'webgl-methods' }
GLContext >> clear [
	webGL clear: COLOR_BUFFER_BIT | DEPTH_BUFFER_BIT.

]

{ #category : #shaders }
GLContext >> compileShader: shader [
	^ webGL compileShader: shader
]

{ #category : #buffers }
GLContext >> createProgram [
	^ GLProgram new shaderProgram: webGL createProgram webGL: webGL
]

{ #category : #shaders }
GLContext >> createShader: type [
	^ webGL createShader: type
]

{ #category : #'webgl-methods' }
GLContext >> drawArrays: type offset: offset vertexCount: count [
	webGL drawArrays: type offset: offset vertexCount: count.

]

{ #category : #'webgl-methods' }
GLContext >> drawElements: drawOp vertexCount: count type: type offset: offset [
	webGL drawElements: drawOp vertexCount: count type: type offset: offset.

]

{ #category : #textures }
GLContext >> emptyTexture [
	| texture |
  texture := webGL createTexture.
  webGL bindTexture: TEXTURE_2D with: texture.

  " Because images have to be download over the internet
    they might take a moment until they are ready.
    Until then put a single pixel in the texture so we can
    use it immediately. When the image has finished downloading
    we'll update the texture with the contents of the image. "
console log: #emptyTexture.
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

{ #category : #initialization }
GLContext >> fromCanvas: selector [
	| canvas |
	canvas := document getElementById: selector.
	webGLVersion := 2.
	webGL := (canvas getContext: #webgl2) ifNil: [ webGLVersion := 1. canvas getContext: #webgl ].
	webGL ifNil: [ self error: 'Unable to initialize WebGL. Your browser or machine may not support it.' ].
	GLConstants loadConstants: webGL.
	webGL clearColor: 0 green: 0.3 blue: 0 alpha: 1.
	webGL clearDepth: 1.
	webGL enable: DEPTH_TEST.
	webGL depthFunc: LEQUAL.

]

{ #category : #shaders }
GLContext >> getShaderParameter: program parameter: parameter [
	^ webGL getShaderParameter: program parameter: parameter
]

{ #category : #initialization }
GLContext >> initialize [
	super initialize.
	programs := IdentitySet new.

]

{ #category : #textures }
GLContext >> loadTexture: url [
	| texture image |
	texture := self emptyTexture.
	image := Image new.
	image addEventListener: #load block: [
		console log: #loadTexture.
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
    (self webGLVersion > 1 or: [image width isPowerOfTwo & image height isPowerOfTwo]) ifTrue: [
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

{ #category : #rendering }
GLContext >> removeObject: aGlObject [
	(programs like: aGlObject program) ifNotNil: [ : program |
		program removeObject: aGlObject.
		program empty ifTrue: [
			programs removeKey: program ifAbsent: []].
	].

]

{ #category : #shaders }
GLContext >> shaderSource: shader source: source [
	^ webGL shaderSource: shader source: source
]

{ #category : #shaders }
GLContext >> useProgram: aWebGLProgram [
	webGL useProgram: aWebGLProgram.

]

{ #category : #accessing }
GLContext >> webGLVersion [
	^ webGLVersion
]
