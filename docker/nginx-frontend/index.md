---
layout: default
title: "My GitHub Pages with Timur Samanchi"
---

# 🌟 Welcome to Timur's Quote Site - Kubernetes - Jekyll 🌟

This is my EKS Helm deployment page using the **{{ site.theme_name }}**.

> Quote of the day:  
> <span id="quote">Loading quote...</span>

<script>
  fetch('/quote/')
    .then(response => response.json())
    .then(data => {
      document.getElementById('quote').innerText = data.quote;
    })
    .catch(err => {
      document.getElementById('quote').innerText = 'Error loading quote';
    });
</script>

---

## Contact

You can find me on:
- GitHub: [timursamanchi](https://github.com/timursamanchi)
