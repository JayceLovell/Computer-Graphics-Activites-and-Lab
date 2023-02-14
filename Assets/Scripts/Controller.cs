using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class Controller : MonoBehaviour
{
    public Material Shield;
    public Material DefaultMaterial;
    private Vector2 moveInput = Vector2.zero;
    Rigidbody _rigidbody;
    float PlayerSpeed = 5f;
    void Start()
    {
        _rigidbody = GetComponent<Rigidbody>();
    }
    void FixedUpdate()
    {
        _rigidbody.velocity = moveInput * PlayerSpeed;
    }
    void OnMove(InputValue value)
    {
            if (value.Get<Vector2>().x != 0 && value.Get<Vector2>().y == 0)
                moveInput = value.Get<Vector2>();
            else if (value.Get<Vector2>().y != 0 && value.Get<Vector2>().x == 0)
                moveInput = value.Get<Vector2>();
            else
                moveInput = Vector2.zero;       
    }
    /// <summary>
    /// Shields
    /// </summary>
    void OnOne()
    {
        this.gameObject.GetComponent<MeshRenderer>().material = Shield;
        StartCoroutine(switchBack());
    }
    private IEnumerator switchBack()
    {
        yield return new WaitForSeconds(5f);
        this.gameObject.GetComponent<MeshRenderer>().material = DefaultMaterial;
    }
    void OnTwo()
    {

    }
    void OnThree()
    {

    }
    void OnFour()
    {

    }
    void OnFive()
    {

    }
    void OnSix()
    {

    }
    void OnSeven()
    {

    }
    void OnEight()
    {

    }
    void OnNine()
    {

    }
}
