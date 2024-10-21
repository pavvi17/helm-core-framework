document.getElementById('inputForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the page from reloading
    
    const serviceName = document.getElementById('serviceName').value;
    const output = document.getElementById('output');
    
    // Clear previous output
    output.innerHTML = '';

    // Generate Helm repo file contents
    const chartYaml = `
    <h3>Chart.yaml</h3>
    <pre>
apiVersion: v2
name: ${serviceName}
description: A Helm chart for ${serviceName}
version: 1.0.0
appVersion: "1.0"
    </pre>`;

    const valuesYaml = `
    <h3>values.yaml</h3>
    <pre>
replicaCount: 1
service:
  name: ${serviceName}-service
  type: ClusterIP
  port: 80

image:
  repository: myrepo/${serviceName}
  tag: "latest"
    </pre>`;

    // Add the generated content to the output div
    output.innerHTML = chartYaml + valuesYaml;
});
