for i in 1..10 do
    Task.create(title: "Title - #{i}", description: "lorem - #{i}", start_date: "date - #{i}", end_date: "date - #{i}", status: "status - #{i}", tag_id: 1)
end
