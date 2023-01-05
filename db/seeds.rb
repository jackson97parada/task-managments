for i in 1..10 do
    Employee.create(name: "Name - #{i}", last_name: "last_name - #{i}", document: "documento - #{i}", mobile: "mob: 300", salary: "Salary - #{i}", enable: "true")
end
