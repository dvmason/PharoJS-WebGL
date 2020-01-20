"
I am a GL fragment shader
"
Class {
	#name : #GLFragmentShader,
	#superclass : #GLShadingLanguage,
	#category : #'WebGL-Kernel'
}

{ #category : #accessing }
GLFragmentShader >> shaderType [
	^ FRAGMENT_SHADER
]
