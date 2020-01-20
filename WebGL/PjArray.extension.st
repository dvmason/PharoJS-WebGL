Extension { #name : #PjArray }

{ #category : #'*WebGL' }
PjArray >> addColor: aColor [
	^ self addLast: aColor red; addLast: aColor green; addLast: aColor blue; addLast: aColor alpha.
]
