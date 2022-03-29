using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParticleSpawner : MonoBehaviour
{
    [SerializeField]
    private Particle particlePrefab;

    private int particle_cnt = 0;

    private void Start()
    {
        StartCoroutine(ParticleSpawnRoutine());
    }

    private IEnumerator ParticleSpawnRoutine()
    {
        while(particle_cnt < 10)
        {
            yield return new WaitForSeconds(2f);
            var part = Instantiate(particlePrefab, transform.position, Quaternion.identity);
            part.name = "Particle " + particle_cnt;
            particle_cnt++;
        }
    }
}
