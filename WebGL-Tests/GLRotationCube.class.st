"
I am a rotating cube with various renderings
"
Class {
	#name : #GLRotationCube,
	#superclass : #GLObject,
	#instVars : [
		'modelViewMatrix',
		'rotatedViewMatrix',
		'version',
		'texture'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #description }
GLRotationCube class >> appJsSubFolder [
	<pharoJsSkip>
	^ 'js'
]

{ #category : #accessing }
GLRotationCube class >> exportVersion [
	<jsLiteralGenerator>
	^ exportVersion
]

{ #category : #initialization }
GLRotationCube >> addWarning [
	| div |
	div := document createElement: #div.
	div innerHTML: 'The texture may not show because this is running from a "file:" protocol'.
	div style: 'font-size: 200%; color: red'.
	document body appendChild: div.

]

{ #category : #drawing }
GLRotationCube >> animate [
	| rotation |
	rotation := 0.
	gl animate: [: deltaTime |
		self drawScene: rotation.
		rotation := rotation + (0.001 * deltaTime).
	].

]

{ #category : #drawing }
GLRotationCube >> drawScene: rotation [
	gl clear.
	version < 3 ifTrue: [
		mat4
			copy: rotatedViewMatrix
			from: modelViewMatrix
	] ifFalse: [
		mat4
			rotate: rotatedViewMatrix
			from: modelViewMatrix
			rotation: rotation
			axis: #(0 0 1).
		version >= 4 ifTrue: [
			mat4
				rotate: rotatedViewMatrix
				from: rotatedViewMatrix
				rotation: rotation * 0.7
				axis: #(0 1 0)
	]].
	program
		uniformMatrix4fv: #uModelViewMatrix
		matrix: rotatedViewMatrix.
	version < 4 ifTrue: [
		^ gl drawArrays: TRIANGLE_STRIP offset: 0 vertexCount: 4
	].
	version > 4 ifTrue: [
		program
			activeTexture: TEXTURE0; "Tell WebGL we want to affect texture unit 0"
			bindTexture: TEXTURE_2D with: texture; "Bind the texture to texture unit 0"
			uniformiAt: #uSampler put: 0 "Tell the shader we bound the texture to texture unit 0"
	].
	version >= 4 ifTrue: [
		program bindElementBuffer: #index.
		^ gl drawElements: TRIANGLES vertexCount: 36 type: UNSIGNED_SHORT offset: 0
	].
	^ self
]

{ #category : #initialization }
GLRotationCube >> initBuffers [
	version <= 3 ifTrue: [ ^ self initBuffers2D ].
	self initBuffers3D.
	version = 4 ifTrue: [ ^ self initBuffersVertexColoring ].
	self initBuffersTexture.


]

{ #category : #initialization }
GLRotationCube >> initBuffers2D [
	gl
		createBuffer: #position;
		arrayBuffer: #position;
		fillBuffer: #(
			-1  1
			 1  1
			-1 -1
			 1 -1
		);
		point: #aVertexPosition components: 2.

	gl
		createBuffer: #color;
		arrayBuffer: #color;
		fillBuffer: #(
			1 1 1 1
			1 0 0 1
			0 1 0 1
			0 0 1 1
		);
		point: #aVertexColor components: 4.

]

{ #category : #initialization }
GLRotationCube >> initBuffers3D [
	gl
		createBuffer: #position;
		arrayBuffer: #position;
		fillBuffer: #(
	 "Front face"
  -1.0 -1.0  1.0
   1.0 -1.0  1.0
   1.0  1.0  1.0
  -1.0  1.0  1.0
  
   "Back face"
  -1.0 -1.0 -1.0
  -1.0  1.0 -1.0
   1.0  1.0 -1.0
   1.0 -1.0 -1.0
  
   "Top face"
  -1.0  1.0 -1.0
  -1.0  1.0  1.0
   1.0  1.0  1.0
   1.0  1.0 -1.0
  
   "Bottom face"
  -1.0 -1.0 -1.0
   1.0 -1.0 -1.0
   1.0 -1.0  1.0
  -1.0 -1.0  1.0
  
   "Right face"
   1.0 -1.0 -1.0
   1.0  1.0 -1.0
   1.0  1.0  1.0
   1.0 -1.0  1.0
  
   "Left face"
  -1.0 -1.0 -1.0
  -1.0 -1.0  1.0
  -1.0  1.0  1.0
  -1.0  1.0 -1.0
		);
		point: #aVertexPosition components: 3.

	gl
		createBuffer: #index;
		elementArrayBuffer: #index;
		fillBuffer: #(
			0  1  2      0  2  3    " front "
			4  5  6      4  6  7    " back "
			8  9  10     8  10 11   " top "
			12 13 14     12 14 15   " bottom "
			16 17 18     16 18 19   " right "
			20 21 22     20 22 23   " left "
		).

]

{ #category : #initialization }
GLRotationCube >> initBuffersTexture [
	| textureCoordinates |
	textureCoordinates := #(
    " Front "
    0.0  0.0
    0.0  1.0
    1.0  1.0
    1.0  0.0
    " Back "
    0.0  0.0
    0.0  1.0
    1.0  1.0
    1.0  0.0
    " Top "
    0.0  0.0
    0.0  1.0
    1.0  1.0
    1.0  0.0
    " Bottom "
    0.0  0.0
    0.0  1.0
    1.0  1.0
    1.0  0.0
    " Right "
    0.0  0.0
    0.0  1.0
    1.0  1.0
    1.0  0.0
    " Left "
    0.0  0.0
    0.0  1.0
    1.0  1.0
    1.0  0.0
  ).
	gl
		createBuffer: #texture;
		arrayBuffer: #texture;
		fillBuffer: textureCoordinates;
		point: #aTextureCoord components: 2.

]

{ #category : #initialization }
GLRotationCube >> initBuffersVertexColoring [
	| faceColors colors |
	faceColors := "#(white red green blue yellow purple) collect: [: color | Color named: color ]"
		#(
			(1.0  1.0  1.0  1.0)    " Front face: white "
			(1.0  0.0  0.0  1.0)    " Back face: red "
			(0.0  1.0  0.0  1.0)    " Top face: green "
			(0.0  0.0  1.0  1.0)    " Bottom face: blue "
			(1.0  1.0  0.0  1.0)    " Right face: yellow "
			(1.0  0.0  1.0  1.0)    " Left face: purple "
		).
	colors := OrderedCollection new.
	faceColors do: [: color | colors addAll: color; addAll: color; addAll: color; addAll: color ].
	gl
		createBuffer: #color;
		arrayBuffer: #color;
		fillBuffer: colors;
		point: #aVertexColor components: 4.

]

{ #category : #initialization }
GLRotationCube >> initMatrices [
	| projectionMatrix |
	projectionMatrix := mat4 create.
	mat4
		perspective: projectionMatrix
		fieldOfView: 45 degreesToRadians
		aspect: gl aspect
		near: 0.1
		far: 100.
	modelViewMatrix := mat4 create.
	mat4
		translate: modelViewMatrix
		from: modelViewMatrix
		translation: #(0 0 -6).
	gl
		uniformMatrix4fv: #uProjectionMatrix
		matrix: projectionMatrix.
	rotatedViewMatrix := mat4 create.

]

{ #category : #initialization }
GLRotationCube >> initProgram [
	version = 1 ifTrue: [ ^ self initProgramWhite ].
	version <= 4 ifTrue: [ ^ self initProgramVertexColoured ].
	version > 4 ifTrue: [ ^ self initProgramFaceTextured ].

]

{ #category : #initialization }
GLRotationCube >> initProgramFaceTextured [
	gl initProgram;
		varying: #vec2 asGLType highp named: #vTextureCoord;
		addShader: (
			GLVertexShader new
				attribute: #vec4 named: #aVertexPosition;
				attribute: #vec2 named: #aTextureCoord;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #main;
				code: 'gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition';
				code: 'vTextureCoord = aTextureCoord';
				yourself
			);
		addShader: (
			GLFragmentShader new
				uniform: #sampler2D named: #uSampler;
				function: #main;
				code: 'gl_FragColor = texture2D(uSampler, vTextureCoord)';
				yourself
			);
		linkProgram;
		useProgram.

]

{ #category : #initialization }
GLRotationCube >> initProgramVertexColoured [
	gl initProgram;
		varying: #vec4 asGLType lowp named: #vColor;
		addShader: (
			GLVertexShader new
				attribute: #vec4 named: #aVertexPosition;
				attribute: #vec4 named: #aVertexColor;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #main;
				code: 'gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition';
				code: 'vColor = aVertexColor';
				yourself
			);
		addShader: (
			GLFragmentShader new
				function: #main;
				code: 'gl_FragColor = vColor';
				yourself
			);
		linkProgram;
		useProgram.

]

{ #category : #initialization }
GLRotationCube >> initProgramWhite [
	gl initProgram;
		addShader: (
			GLVertexShader new
				attribute: #vec4 named: #aVertexPosition;
				attribute: #vec4 named: #aVertexColor;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #main;
				code: 'gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition';
				yourself
			);
		addShader: (
			GLFragmentShader new
				function: #main;
				code: 'gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0)';
				yourself
			);
		linkProgram;
		useProgram.

]

{ #category : #initialization }
GLRotationCube >> initialize [
	super initialize.
	gl := GLContext new.
	console log: gl webGLVersion.
	version := self class exportVersion.
	self initProgram.
	version > 4 ifTrue: [
		document location protocol = 'file:' ifTrue: [ self addWarning ].
		texture := gl loadTexture: 'JS.png'.
	].
	self initBuffers.
	self initMatrices.
	self animate
]
