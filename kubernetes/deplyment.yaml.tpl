apiVersion: apps/v1
kind: Deployment
metadata:
  name: wisecow-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wisecow-app
  template:
    metadata:
      labels:
        app: wisecow-app
    spec:
      containers:
      - name: wisecow-app
        image: IMAGE_PLACEHOLDER  # This is the placeholder to be replaced
        ports:
        - containerPort: 4499
