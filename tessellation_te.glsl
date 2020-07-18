#version 430 

//layout (triangles, equal_spacing, ccw) in;
//Try some of these other options
//layout (triangles, fractional_odd_spacing, ccw) in;
//layout (triangles, fractional_even_spacing, ccw) in;

layout (quads, fractional_odd_spacing, ccw) in;

void main()
{
	const float u = gl_TessCoord[0];
	const float v = gl_TessCoord[1];
	//const float w = gl_TessCoord[2];
	//const float z = gl_TessCoord[3];

	const vec4 p0 = gl_in[0].gl_Position;
	const vec4 p1 = gl_in[1].gl_Position;
	const vec4 p2 = gl_in[2].gl_Position;
	const vec4 p3 = gl_in[3].gl_Position;

	//gl_Position = u*p0 + v*p1 + w*p2;

	const vec4 q0 = mix(p0, p1, u);
	const vec4 q1 = mix(p3, p2, u);
	const vec4 s = mix(q0, q1, v);
	gl_Position = s;

}
