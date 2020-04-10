"
I am a GL fragment shader
"
Class {
	#name : #GLFragmentShader,
	#superclass : #GLShadingLanguage,
	#category : #'WebGL-Programs'
}

{ #category : #accessing }
GLFragmentShader >> shaderType [
	^ FRAGMENT_SHADER
]
