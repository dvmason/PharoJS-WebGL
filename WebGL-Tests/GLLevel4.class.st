"
https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL
"
Class {
	#name : #GLLevel4,
	#superclass : #GLLevel1,
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #initialization }
GLLevel4 >> initBuffers3D [
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
				);
			point: #aVertexPosition components: 3
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

{ #category : #initialization }
GLLevel4 >> initBuffersVertexColoring [
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
			fillBuffer: colors;
			point: #aVertexColor components: 4
	].

]

{ #category : #initialization }
GLLevel4 >> initializeGL [
	document location protocol = 'file:' ifTrue: [ self addWarning ].
	self initBuffers3D.
	self initBuffersVertexColoring.

]
