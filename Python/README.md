# Requirements
python 3.10

pip 22.2

# Run
Use the following command to run the project from terminal
```bash
python3 app.py
```

Use the following url to access the project

http://localhost:8000/

# Usage
Two endpoints to use the project

## /api/v1/training
Return and download (in /data) the json of the list of training get from the "la bonne alternance" API

## /api/v1/profession
Return and download (in /data) the json of the list of professions get from the "la bonne alternance" API

# Test
Use the following command to launch the test of the project

locust -f locust.py --host http://localhost:8000 --users 100 --spawn-rate 10

Find the test report in /test