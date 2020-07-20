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
GLLevel5 class >> createProgram: program [
	program
		varying: #vec2 asGLType highp named: #vTextureCoord;
		vertexShader: [: vertexShader |
			vertexShader
				attribute: #vec4 named: #aVertexPosition;
				attribute: #vec2 named: #aTextureCoord;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #main;
				assign: #gl_Position equals: #( uProjectionMatrix * uModelViewMatrix * aVertexPosition );
				assign: #vTextureCoord equals: #aTextureCoord;
				yourself
			];
		fragmentShader: [: fragmentShader |
			fragmentShader
				uniform: #sampler2D named: #uSampler;
				function: #main;
				assign: #gl_FragColor equals: #( texture2D ( uSampler vTextureCoord ) );
				yourself
			];
		linkProgram.

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
			fillBuffer: textureCoordinates
	].

]

{ #category : #rendering }
GLLevel5 class >> initializeProgram: program [
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
	program
		point: #aTextureCoord at: #texture components: 2;
		activeTexture: TEXTURE0; "Tell WebGL we want to affect texture unit 0"
		bindTexture: TEXTURE_2D with: texture; "Bind the texture to texture unit 0"
		uniformiAt: #uSampler put: 0. "Tell the shader we bound the texture to texture unit 0"
	super drawDelta: secondsSinceLastDraw total: secondsSinceProgramStart.

]
