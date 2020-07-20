"
https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL
"
Class {
	#name : #GLLevel3,
	#superclass : #GLLevel2,
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #rendering }
GLLevel3 >> drawDelta: secondsSinceLastDraw total: secondsSinceProgramStart [
	mat4
		rotate: rotatedViewMatrix
		from: self modelViewMatrix
		rotation: secondsSinceProgramStart 
		axis: #(0 1 1).
	program
		uniformMatrix4fv: #uModelViewMatrix matrix: rotatedViewMatrix;
		point: #aVertexPosition at: #position components: 2;
		point: #aVertexColor at: #color components: 4;
		drawArrays: TRIANGLE_STRIP offset: 0 vertexCount: 4

]
