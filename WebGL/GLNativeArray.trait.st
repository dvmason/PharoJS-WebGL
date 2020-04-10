"
I contain methods shared among Javascript native array types
"
Trait {
	#name : #GLNativeArray,
	#traits : 'PjTArray + PjTExtensionClass',
	#classTraits : 'PjTArray classTrait + PjTExtensionClass classTrait',
	#category : #'WebGL-Programs'
}

{ #category : #'as yet unclassified' }
GLNativeArray >> vectorLength [
	<javascript: 'var t=0;console.log(this,this.length);for(var i=0;i<this.length;++i) t+=this[i];return Math.sqrt(t)'>
	^ self shouldNotImplement
]
