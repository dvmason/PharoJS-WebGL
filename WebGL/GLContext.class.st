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
		'webGL',
		'suffix'
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
GLContext class >> fromCanvas: canvas animate: startAnimation [
	| result |
	self log: [GLFloat32Array x: 1 y: 2 z: 4].
	result := super new fromCanvas: canvas.
	startAnimation ifTrue: [ result startAnimation ].
	^ result
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
	^ self fromCanvas: #glCanvas animate: true
]

{ #category : #'instance creation' }
GLContext class >> noAnimate [
	^ self fromCanvas: #glCanvas animate: false
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

{ #category : #rendering }
GLContext >> addObject: aGlObject [
	(self programFor: aGlObject) addObject: aGlObject
]

{ #category : #accessing }
GLContext >> aspect [
	^ webGL drawingBufferWidth / webGL drawingBufferHeight
]

{ #category : #initialization }
GLContext >> camera [
	^ camera ifNil: [ camera := GLCamera new context: self ]
]

{ #category : #'webgl-methods' }
GLContext >> clear [
	webGL log: 'clear:'.
	webGL clear: COLOR_BUFFER_BIT | DEPTH_BUFFER_BIT.

]

{ #category : #shaders }
GLContext >> compileShader: shader [
	webGL log: 'compileShader:'.
	^ webGL compileShader: shader
]

{ #category : #buffers }
GLContext >> createProgram [
	webGL log: 'createProgram'.
	^ self programClass new
		suffix: self newSuffix;
		shaderProgram: webGL createProgram webGL: webGL context: self
]

{ #category : #shaders }
GLContext >> createShader: type [
	webGL log: 'createShader:'.
	^ webGL createShader: type
]

{ #category : #rendering }
GLContext >> drawDelta: deltaTime total: total [
	self clear.
	programs valuesDo: [ : aGLProgram |
			aGLProgram drawDelta: deltaTime total: total camera: self camera.
	].

]

{ #category : #rendering }
GLContext >> drawOnce [
	self drawDelta: 0 total: 0.

]

{ #category : #initialization }
GLContext >> fromCanvas: selector [
	| canvas |
	canvas := document getElementById: selector.
	webGLVersion := 2.
	webGL := (canvas getContext: #webgl2) ifNil: [ webGLVersion := 1. canvas getContext: #webgl ].
	webGL ifNil: [ self error: 'Unable to initialize WebGL. Your browser or machine may not support it.' ].
	GLConstants loadConstants: webGL.
	webGL js_at: '_log_' put: [: aString | console log: 'webGL: ' with: aString ].
	webGL log: 'webGL clearColor:'.
	webGL clearColor: 0 green: 0.3 blue: 0 alpha: 1.
	webGL clearDepth: 1.
	webGL enable: DEPTH_TEST.
	webGL depthFunc: LEQUAL.

]

{ #category : #shaders }
GLContext >> getShaderParameter: program parameter: parameter [
	webGL log: 'getShaderParameter:'.
	^ webGL getShaderParameter: program parameter: parameter
]

{ #category : #initialization }
GLContext >> initialize [
	super initialize.
	programs := Dictionary new.

]

{ #category : #textures }
GLContext >> log: aString [
	console log: aString.

]

{ #category : #initialization }
GLContext >> newSuffix [
	^ (suffix := (suffix ifNil: [ 0 ])+1) asString
]

{ #category : #buffers }
GLContext >> programClass [
	^ GLProgram
]

{ #category : #rendering }
GLContext >> programFor: aGlObject [
	| programClass |
	programClass := aGlObject class programClass.
	^ programs at: programClass name ifAbsentPut: [
			self createProgram programClass: programClass
		]
	
]

{ #category : #rendering }
GLContext >> removeObject: aGlObject [
	self flag: #theTypesHaveChanged.
	(programs like: aGlObject program) ifNotNil: [ : program |
		program removeObject: aGlObject.
		program empty ifTrue: [
			programs removeKey: program ifAbsent: []].
	].

]

{ #category : #shaders }
GLContext >> shaderSource: shader source: source [
	webGL log: 'shaderSource:'.
	^ webGL shaderSource: shader source: source
]

{ #category : #rendering }
GLContext >> startAnimation [
	| then render total |
	window isPjProxyOrNil ifTrue: [ ^ self ].
	render := then := nil.
	total := fps := 0.
	render := [: now | | deltaTime |
		deltaTime := 0.001*(now - then).
		deltaTime > 0 ifTrue: [fps := 1.0 / deltaTime.		console log: fps].
		then := now.
		total := total + deltaTime.
		self drawDelta: deltaTime total: total.
		window requestAnimationFrame: render.
	].
	window requestAnimationFrame: [: now | then := now. render value: now].

]

{ #category : #shaders }
GLContext >> useProgram: aWebGLProgram [
	webGL log: 'useProgram:'.
	webGL useProgram: aWebGLProgram.

]

{ #category : #accessing }
GLContext >> webGLVersion [
	^ webGLVersion
]
