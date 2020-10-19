module EventRepresentations
  include AsJsonRepresentations

  representation :basic do
    {
      title: title,
      description: description,
      start_date: start_date,
      end_date: end_date
    }
  end
end