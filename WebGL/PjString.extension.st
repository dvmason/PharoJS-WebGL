Extension { #name : #PjString }

{ #category : #'*WebGL' }
PjString class >> jsTranspilationImportMethodsNonstandard [
	<pharoJsSkip>
	^ {
			Symbol -> #(
				asGLType 
			).
		}
]
