#coding:utf-8
import requests
import pprint
import json

BASE_URL = 'https://labonnealternance.apprentissage.beta.gouv.fr/api/V1/'
error_msg = 'An error occured !'


# Make a get request and return the response
def make_get_request(endpoint, params={}):
    return requests.get(BASE_URL + endpoint, params=params)


# Get and return data about training
def get_training(): 
    """
    params and endpoint for training 
    for sorting by region, queries region or departement is mandatory)
    """
    training_end_point = 'formationsParRegion'
    training_params = {
        'romes' : 'F1603,M1805',
        #'region' : '27',
        'departement' : '',
        'caller' : 'contact@domaine',
        'opco' : 'akto'
    }

    response = make_get_request(training_end_point, training_params)

    if response.status_code != 200:
        print(error_msg)
        return error_msg
    else :
        data = response.json()['results']
        #pprint.pprint(data)
        writeFile = open('data/formations.json', 'w')
        writeFile.write(json.dumps(data, indent=4))
        writeFile.close()
        return data


# Get and return data about profession
def get_profession(): 
    profession_end_point = 'metiers/all'

    response = make_get_request(profession_end_point)

    if response.status_code != 200:
        print(error_msg)
        return error_msg
    else :
        data = response.json()['metiers']
        #pprint.pprint(data)
        writeFile = open('data/metiers.json', 'w')
        writeFile.write(json.dumps(data, indent=4))
        writeFile.close()
        return data


result = get_training()
#pprint.pprint(result)
result = get_profession()
#pprint.pprint(result)