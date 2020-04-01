"
Because of foul-ups in the ECMA spec, you can't subclass this!
"
Class {
	#name : #GLFloat32Array,
	#superclass : #FloatArray,
	#type : #words,
	#traits : 'GLNativeArray',
	#classTraits : 'GLNativeArray classTrait',
	#category : #'WebGL-Kernel'
}

{ #category : #'pharoJs support' }
GLFloat32Array class >> javascriptName [
	<pharoJsSkip>
	^ #Float32Array
]

{ #category : #'as yet unclassified' }
GLFloat32Array class >> javascriptSkipSubclassing [
	^ true
]

{ #category : #'instance creation' }
GLFloat32Array class >> new [
	^ self x: 0 y: 0 z: 0

]

{ #category : #'instance creation' }
GLFloat32Array class >> x: x y: y z: z [
	<javascript: 'return new this([x,y,z])'>
	^ self shouldNotImplement
]
