using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Lab02 : MonoBehaviour
{
    public List<Material> materials = new List<Material>();

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.Alpha1))
        {
            this.gameObject.GetComponent<MeshRenderer>().material = materials[0];
        }
        if (Input.GetKey(KeyCode.Alpha2))
        {
            this.gameObject.GetComponent<MeshRenderer>().material = materials[1];
        }
        if (Input.GetKey(KeyCode.Alpha3))
        {
            this.gameObject.GetComponent<MeshRenderer>().material = materials[2];
        }
        if (Input.GetKey(KeyCode.Alpha4))
        {
            this.gameObject.GetComponent<MeshRenderer>().material = materials[3];
        }
        if (Input.GetKey(KeyCode.Alpha5))
        {
            this.gameObject.GetComponent<MeshRenderer>().material = materials[4];
        }
        if (Input.GetKey(KeyCode.Alpha6))
        {
            this.gameObject.GetComponent<MeshRenderer>().material = materials[5];
        }
    }
}
