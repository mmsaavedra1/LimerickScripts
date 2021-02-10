import csv
import json
import sys

def load_students_list(list_file_name):
    print("Leyendo el archivo {}...".format(list_file_name))
    with open("{}".format(list_file_name), 'r') as fp:
        students_list = [i.strip().split(',') for i in fp.readlines()]
    print("Lista de alumnos leida correctamente, se obtuvieron {} alumnos".format(len(students_list)))
    return students_list

students_list_filename = sys.argv[1]
students_list_output_filename = sys.argv[2]

students_list = load_students_list(students_list_filename)
output = []
for i in range(len(students_list)):
    student_data = students_list[i]
    student = {}
    student["alumni_number"] = student_data[0]
    student["email"] = student_data[-1]
    student["name"] = student_data[-2].strip().split()[0].capitalize()
    student["last_name"] = student_data[1].strip().capitalize()
    output.append(student)

print("Guardando la lista en el archivo {}...".format(students_list_output_filename))
with open(students_list_output_filename, 'w') as fp:
    json.dump(output, fp, indent=4, ensure_ascii=False)
print("Lista guardada con éxito. Exiting..".format(students_list_output_filename))
