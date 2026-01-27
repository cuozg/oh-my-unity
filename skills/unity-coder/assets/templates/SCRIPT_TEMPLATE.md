# SCRIPT_TEMPLATE.cs

```csharp
using UnityEngine;
using System;
using System.Collections.Generic;

namespace _Project.Scripts.FeatureName // Update namespace based on directory
{
    /// <summary>
    /// Briefly describe the purpose of this script.
    /// </summary>
    public class NewScript : MonoBehaviour
    {
        #region Serialized Fields
        [Header("Settings")]
        [SerializeField] private float speed = 5f;
        #endregion

        #region Private Fields
        private bool _isActive;
        #endregion

        #region Lifecycle
        private void Awake()
        {
            // Cache references here
        }

        private void Start()
        {
            // Initial logic here
        }
        #endregion

        #region Public Methods
        public void ExecuteAction()
        {
            // Implementation
        }
        #endregion

        #region Private Methods
        private void ProcessLogic()
        {
            // Internal implementation
        }
        #endregion
    }
}
```
