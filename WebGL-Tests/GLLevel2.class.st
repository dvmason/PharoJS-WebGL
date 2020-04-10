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
GLLevel2 class >> createProgram: gl [
	^ gl createProgram
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
		linkProgram

]

{ #category : #initialization }
GLLevel2 >> initColours [
	program
		createBuffer: #color then: [
			program
				arrayBuffer: #color;
				fillBuffer: #(
						1 1 1 1
						1 0 0 1
						0 1 0 1
						0 0 1 1
					);
				point: #aVertexColor components: 4
	].

]
