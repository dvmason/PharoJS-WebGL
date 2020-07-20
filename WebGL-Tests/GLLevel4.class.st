"
https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL
"
Class {
	#name : #GLLevel4,
	#superclass : #GLLevel2,
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #rendering }
GLLevel4 class >> initBuffers3D: program [
	program createBuffer: #position then: [
		program
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
				)
	].

	program createBuffer: #index then: [
		program
			elementArrayBuffer: #index;
			fillBuffer: #(
				0  1  2      0  2  3    " front "
				4  5  6      4  6  7    " back "
				8  9  10     8  10 11   " top "
				12 13 14     12 14 15   " bottom "
				16 17 18     16 18 19   " right "
				20 21 22     20 22 23   " left "
			)
	].

]

{ #category : #rendering }
GLLevel4 class >> initBuffersVertexColoring: program [
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
	program createBuffer: #color then: [
		program
			arrayBuffer: #color;
			fillBuffer: colors
	].

]

{ #category : #rendering }
GLLevel4 class >> initializeProgram: program [
	self initBuffers3D: program.
	self initBuffersVertexColoring: program.

]

{ #category : #rendering }
GLLevel4 >> drawDelta: secondsSinceLastDraw total: secondsSinceProgramStart [
	mat4
		rotate: rotatedViewMatrix
		from: self modelViewMatrix
		rotation: secondsSinceProgramStart * 0.7
		axis: #(0 1 0).
	program
		point: #aVertexPosition at: #position components: 3;
		elementArrayBuffer: #index;
		point: #aVertexColor at: #color components: 4;
		uniformMatrix4fv: #uModelViewMatrix matrix: rotatedViewMatrix;
		drawElements: TRIANGLES vertexCount: 36 type: UNSIGNED_SHORT offset: 0

]
