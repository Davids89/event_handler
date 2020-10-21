module EventRepresentations
  include AsJsonRepresentations

  representation :basic do
    {
      title: title,
      description: description,
      start_date: start_date.strftime('%d/%m/%Y'),
      end_date: end_date.strftime('%d/%m/%Y')
    }
  end
end
