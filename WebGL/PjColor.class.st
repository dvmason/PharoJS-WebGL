Class {
	#name : #PjColor,
	#superclass : #PjObject,
	#category : #WebGL
}

{ #category : #'pharojs support' }
PjColor class >> jsTranspilationImportMethods [
	<pharoJsSkip>
	^ {(Color  
				->
					#(red green blue alpha)).
		(Color class 
				->
					#(named:)).
							}
]
