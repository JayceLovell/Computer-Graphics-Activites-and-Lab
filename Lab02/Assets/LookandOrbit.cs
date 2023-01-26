using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LookandOrbit : MonoBehaviour
{
    public Transform MainObject;
    public float OrbitSpeed = 1f;    

    // Update is called once per frame
    void Update()
    {
        transform.RotateAround(MainObject.position, Vector3.up, OrbitSpeed);
        transform.LookAt(MainObject);
    }
}
