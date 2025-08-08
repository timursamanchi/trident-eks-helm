---
layout: default
title: "Timur's Quote Page"
---

## Hello All - from Timur's project: AWS ECS cluster - NEW HORIZON!

### Quote of the day: <span id="quote">Loading...</span>

**Loaded at:** <span id="timestamp">Loading...</span>

<script>
  fetch('/quote')
    .then(response => response.json())
    .then(data => {
      document.getElementById('quote').innerText = data.quote;
      document.getElementById('timestamp').innerText = new Date().toLocaleString();
    })
    .catch(err => {
      document.getElementById('quote').innerText = 'Error loading quote';
      document.getElementById('timestamp').innerText = new Date().toLocaleString();
    });
</script>
