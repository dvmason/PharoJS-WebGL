"
I represent a GL function - including #main
"
Class {
	#name : #GLFunction,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'codeLines',
		'locals',
		'parameters'
	],
	#category : #'WebGL-Programs'
}

{ #category : #converting }
GLFunction >> asString [
	^ type asString,' ',name,'(',
		(parameters isEmpty ifTrue: [#void] ifFalse: [GLShadingLanguage formatDictionary: parameters called: '' separator: ',']),
		'){
	',(locals isEmpty ifTrue: [''] ifFalse: [(GLShadingLanguage formatDictionary: locals called: ''),'
']),
		(';
	' join: codeLines),
		';
}
'
]

{ #category : #construction }
GLFunction >> code: aString [
	codeLines addLast: aString.

]

{ #category : #initialization }
GLFunction >> initialize [
	super initialize.
	codeLines := OrderedCollection new.
	locals := Dictionary new.
	parameters := Dictionary new.


]

{ #category : #construction }
GLFunction >> local: vType named: vName [
	locals at: vName put: vType asGLType.

]

{ #category : #accessing }
GLFunction >> name: aString [ 
	name := aString.

]

{ #category : #accessing }
GLFunction >> type: typeReference [ 
	type := typeReference asGLType.

]
