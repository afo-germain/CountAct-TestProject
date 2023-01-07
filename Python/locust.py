from locust import HttpUser,task, between

class User(HttpUser):
    wait_time = between(1, 5)

    @task
    def home(self):
        self.client.get(url="/")

    @task
    def training(self):
        self.client.get(url="/api/v1/training")

    @task
    def profession(self):
        self.client.get(url="/api/v1/profession")