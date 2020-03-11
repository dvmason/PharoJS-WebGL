"
I contain examples from https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context done using PharoJS and WebGL.
"
Class {
	#name : #GLRotationApp,
	#superclass : #PjWebApplication,
	#instVars : [
		'gl',
		'projectionMatrix',
		'modelViewMatrix',
		'rotatedViewMatrix',
		'version'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #description }
GLRotationApp class >> appJsSubFolder [
	<pharoJsSkip>
	^ 'js'
]

{ #category : #accessing }
GLRotationApp class >> exportVersion [
	<jsLiteralGenerator>
	^ exportVersion
]

{ #category : #drawing }
GLRotationApp >> animate [
	| rotation |
	rotation := 0.
	gl animate: [: deltaTime |
		self drawScene: rotation.
		rotation := rotation + (0.001 * deltaTime).
	].

]

{ #category : #drawing }
GLRotationApp >> drawScene: rotation [
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
			axis: #(-1 1 0)
	].
	gl
		uniformMatrix4fv: #uModelViewMatrix
		matrix: rotatedViewMatrix.
	version < 4 ifTrue: [
		gl drawArrays: TRIANGLE_STRIP offset: 0 vertexCount: 4
	] ifFalse: [
		gl bindElementBuffer: #index.
		gl drawElements: TRIANGLES vertexCount: 36 type: UNSIGNED_SHORT offset: 0.
 	].

]

{ #category : #initialization }
GLRotationApp >> initBuffers [
	version <= 3 ifTrue: [ self initBuffers2D ].
	version > 3 ifTrue: [ self initBuffers3D ].

]

{ #category : #initialization }
GLRotationApp >> initBuffers2D [
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
GLRotationApp >> initBuffers3D [
	| faceColors colors indices |
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

	indices := #(
		0  1  2      0  2  3    " front "
		4  5  6      4  6  7    " back "
		8  9  10     8  10 11   " top "
		12 13 14     12 14 15   " bottom "
		16 17 18     16 18 19   " right "
		20 21 22     20 22 23   " left "
		).
	gl
		createBuffer: #index;
		elementArrayBuffer: #index;
		fillBuffer: indices.

]

{ #category : #initialization }
GLRotationApp >> initMatrices [
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
GLRotationApp >> initProgram [
	version = 1 ifTrue: [ ^ self initProgramWhite ].
	version <= 3 ifTrue: [ ^ self initProgramVertexColoured ].
]

{ #category : #initialization }
GLRotationApp >> initProgramVertexColoured [
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
GLRotationApp >> initProgramWhite [
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
GLRotationApp >> initialize [
	super initialize.
	gl := GLContext new.
	version := self class exportVersion.
	self initProgram.
	self initBuffers.
	self initMatrices.
	self animate
]
