Shader "Custom/WaterShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)        
        _DisplacementStrength("Displacement Strength", Range(0.0,1.0))=0.5
        _WaveFrequency("Wave Frequency", Range(0.1,10.0))=1.0
        _WaveSpeed("Wave Speed", Range(0.1,10.0))=2.0
        _WaveAmplitude("Wave Amplitude", Range(0.0,1.0))=0.2
    }
    SubShader
    {
        pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog
            #include "UnityCG.cginc"

            struct Input
            {
            };

            struct appdata{
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float2 uv :TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
                float4 color:COLOR;
            };
           
            half _DisplacementStrength;
            float _WaveFrequency;
            float _WaveSpeed;
            float _WaveAmplitude;
            float4 _Color;

            v2f vert(appdata v){
                v2f o;
                
                o.uv = v.uv;               
                UNITY_TRANSFER_FOG(o,o.vertex);
                
                 float time = _Time.y;

                float waveDisplacement = sin((v.vertex.x * _WaveFrequency) + (time * _WaveSpeed)) * _WaveAmplitude;

                v.vertex.xyz += v.normal * waveDisplacement;

                float4 temp = float4(v.vertex.x,v.vertex.y,v.vertex.z,1.0);                
                temp.xyz += waveDisplacement * v.normal * _DisplacementStrength;
                o.vertex = UnityObjectToClipPos(temp);
                return o;
            }

            fixed4 frag(v2f i):SV_Target{                
                fixed4 col= _Color;
                UNITY_APPLY_FOG(i.fogCoord,col)
                return col;
            }
            ENDCG
        }
    }
}