"
https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL
"
Class {
	#name : #GLLevel5,
	#superclass : #GLLevel4,
	#instVars : [
		'texture'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#classInstVars : [
		'texture'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #rendering }
GLLevel5 class >> addWarning [
	| div |
	div := document createElement: #div.
	div innerHTML: 'The texture may not show because this is running from a "file:" protocol'.
	div style: 'font-size: 200%; color: red'.
	document body appendChild: div.

]

{ #category : #rendering }
GLLevel5 class >> createProgram: gl [
	^ gl createProgram
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
		linkProgram
]

{ #category : #rendering }
GLLevel5 class >> initBuffersTexture: program [
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
	program createBuffer: #texture then: [
		program
			arrayBuffer: #texture;
			fillBuffer: textureCoordinates;
			point: #aTextureCoord components: 2
	].

]

{ #category : #rendering }
GLLevel5 class >> initializeGL: program [
	document location protocol = 'file:' ifTrue: [ self addWarning ].
	self initBuffers3D: program.
	texture ifNil: [
		texture := program loadTexture: 'JS.png'.
	].
	self initBuffersTexture: program.

]

{ #category : #accessing }
GLLevel5 class >> texture [
	^ texture
]

{ #category : #rendering }
GLLevel5 >> drawDelta: secondsSinceLastDraw total: secondsSinceProgramStart [
	mat4
		rotate: rotatedViewMatrix
		from: rotatedViewMatrix
		rotation: secondsSinceProgramStart * 0.7
		axis: #(0 1 0).
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
