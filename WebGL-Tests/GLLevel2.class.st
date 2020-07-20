"
https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL
"
Class {
	#name : #GLLevel2,
	#superclass : #GLLevel1,
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #rendering }
GLLevel2 class >> createProgram: program [
	program
		varying: #vec4 asGLType lowp named: #vColor;
		vertexShader: [: vertexShader |
			vertexShader
				attribute: #vec4 named: #aVertexPosition;
				attribute: #vec4 named: #aVertexColor;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #main;
				assign: #gl_Position equals: #( uProjectionMatrix * uModelViewMatrix * aVertexPosition );
				assign: #vColor equals: #aVertexColor;
				yourself
			];
		fragmentShader: [: fragmentShader |
			fragmentShader
				function: #main;
				assign: #gl_FragColor equals: #vColor;
				yourself
			];
		linkProgram.

]

{ #category : #rendering }
GLLevel2 class >> initializeProgram: program [
	program
		createBuffer: #position then: [
			program
				arrayBuffer: #position;
				fillBuffer: #(
						-1  1
						 1  1
						-1 -1
						 1 -1
					)
		].
	program
		createBuffer: #color then: [
			program
				arrayBuffer: #color;
				fillBuffer: #(
						1 1 1 1
						1 0 0 1
						0 1 0 1
						0 0 1 1
					)
	].

]

{ #category : #rendering }
GLLevel2 >> drawDelta: delta total: total [
	program
		point: #aVertexColor at: #color components: 4.
	super drawDelta: delta total: total.

]
