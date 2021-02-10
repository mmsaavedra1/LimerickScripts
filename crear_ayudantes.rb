u1 = User.new name: "Juan", last_name: "Idrovo", email: "jpidrovo@uc.cl", alumni_number: "17638798", password: "17638798"
u2 = User.new name: "Isabel", last_name: "Muñoz", email: "imunoz3@uc.cl", alumni_number: "16204964", password: "16204964"
u3 = User.new name: "Javiera", last_name: "Meza", email: "jfmeza@uc.cl", alumni_number: "15638448", password: "15638448"
u4 = User.new name: "José", last_name: "Berguecio", email: "jiberguecio@uc.cl", alumni_number: "16622332", password: "16622332"
u5 = User.new name: "María Antonieta", last_name: "Gallegos", email: "mngallegos@uc.cl", alumni_number: "16207254", password: "16207254"
u6 = User.new name: "Tomás", last_name: "Pérez", email: "tcperez@uc.cl", alumni_number: "17638267", password: "17638267"
u7 = User.new name: "Yael", last_name: "Gorodischer", email: "ygordischer@uc.cl", alumni_number: "15636259", password: "15636259"
u8 = User.new name: "Moisés", last_name: "Saavedra", email: "mmsaavedra1@uc.cl", alumni_number: "16636813", password: "16636813"
u9 = User.new name: "Diego", last_name: "Ramirez", email: "dnramirez@uc.cl", alumni_number: "15623890", password: "56991832664"
u10 = User.new name: "Geraldine", last_name: "Oyarzo", email: "gfoyarzo@uc.cl", alumni_number: "16635663", password: "16635663"
u11 = User.new name: "Matías", last_name: "Haussmann", email: "mihaussmann@uc.cl", alumni_number: "14636298", password: "14636298"
u12 = User.new name: "Matías", last_name: "Orellana", email: "muorellana@uc.cl", alumni_number: "14621134", password: "14621134"
u13 = User.new name: "Stefano", last_name: "Canata", email: "sacanata@uc.cl", alumni_number: "13634127", password: "13634127"
# u8 = User.new name: "", last_name: "", email: "", alumni_number: "", password: ""
u14 = User.new name: "Felipe", last_name: "Heise", email: "fpheise@uc.cl", alumni_number: "1363853j", password: "1363853j"

Meza	Muñoz	Gorodischer	Orellana	Ramirez

u14.add_role(:sub_admin)
u14.save

essay_number = 12
# CorrectionReview.joins(correction: [assignment_schedule: :assignment]).where("score = -1 and assignments.number >= ?", essay_number)
assignment_schedule_id = Assignment.find_by(number: essay_number).assignment_schedules.find_by(stage: 3).id
teacher_assistants_assigned = ["jfmeza@uc.cl", "imunoz3@uc.cl", "ygordischer@uc.cl", "muorellana@uc.cl", "dnramirez@uc.cl"]
ayudantes = User.with_role(:sub_admin).where("users.email in (?)", teacher_assistants_assigned).to_a
# ayudantes << User.find_by(email: "pcnavarr@uc.cl")
index = 0
counter = 0
correction_reviews = CorrectionReview.where(assignment_schedule_id: assignment_schedule_id)
correction_reviews.each do |cr|
  cr.reviewer = ayudantes[index]
  cr.save
  index += 1
  if index >= ayudantes.length
    index = 0
  end
  counter += 1
  p "Se asigno un ensayo a #{ayudantes[index].name} #{ayudantes[index].last_name}"
end
p "Ayudantes: #{ayudantes.pluck(:email)}"
p "Se asignaron #{correction_reviews.length} recorrecciones"


# u1 = User.find_by(name: "Macarenna", last_name: "Pezo", email: "mdpezo@uc.cl", alumni_number: "14635593").id
# u2 = User.find_by(name: "Eduardo", last_name: "Chomali", email: "enchomali@uc.cl", alumni_number: "14632993").id
# u3 = User.find_by(name: "Rommy", last_name: "Malonnek", email: "rpmalonnek@uc.cl", alumni_number: "15635651").id
# u4 = User.find_by(name: "Francisca", last_name: "Salazar", email: "fmsalazar@uc.cl", alumni_number: "1320601J").id
# u5 = User.find_by(name: "Sebastian", last_name: "Zunino", email: "szunino@uc.cl", alumni_number: "13633821").id
# u6 = User.find_by(name: "Alejandro", last_name: "Kaid", email: "aakaid@uc.cl", alumni_number: "1463340J").id
# u7 = User.find_by(name: "Macarena", last_name: "Fuentes", email: "mafuentes3@uc.cl", alumni_number: "14637588").id
# u8 = User.find_by(name: "Felipe", last_name: "Abarca", email: "frabarca@uc.cl", alumni_number: "14637472").id
# u9 = User.new name: "Catalina", last_name: "de la Barra", email: "cpdelabarra@uc.cl", alumni_number: "13636162", password: "13636162"
# u10 = User.new name: "Camila", last_name: "Rivera", email: "clrivera@uc.cl", alumni_number: "13634305", password: "13634305"
# u11 = User.new name: "Andrea", last_name: "Ortiz", email: "alortiz@uc.cl", alumni_number: "15638987", password: "15638987"
# u12 = User.new name: "Maria Ignacia", last_name: "Romero", email: "miromero3@uc.cl", alumni_number: "14632445", password: "14632445"
# u13 = User.new name: "Ana Maria", last_name: "Bernal", email: "ambernal@uc.cl", alumni_number: "18638147", password: "18638147"
# u14 = User.new name: "Joaquin", last_name: "Ossandon", email: "jiossandon@uc.cl", alumni_number: "16636732", password: "16636732"
# u15 = User.new name: "Felipe", last_name: "Cabrera", email: "fncabrera@uc.cl", alumni_number: "16637666", password: "16637666"
