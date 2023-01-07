from flask import Blueprint, jsonify
import controller

routes = Blueprint(__name__, "views")

@routes.route("/")
def home():
    return "Welcome to the home page"

@routes.route("/api/v1/training")
def training():
    return jsonify(controller.get_training())

@routes.route("/api/v1/profession")
def profession():
    return jsonify(controller.get_profession())