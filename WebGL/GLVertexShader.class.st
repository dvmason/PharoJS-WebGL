"
I am a GL vertex shader
"
Class {
	#name : #GLVertexShader,
	#superclass : #GLShadingLanguage,
	#category : #'WebGL-Kernel'
}

{ #category : #accessing }
GLVertexShader >> shaderType [
	^ VERTEX_SHADER
]
