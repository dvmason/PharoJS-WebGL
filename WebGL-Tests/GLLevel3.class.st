"
https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL
"
Class {
	#name : #GLLevel3,
	#superclass : #GLLevel1,
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
		from: modelViewMatrix
		rotation: secondsSinceProgramStart 
		axis: #(0 0 1).
	program
		uniformMatrix4fv: #uModelViewMatrix
		matrix: rotatedViewMatrix;
		drawArrays: TRIANGLE_STRIP offset: 0 vertexCount: 4

]
