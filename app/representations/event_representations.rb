module EventRepresentations
  include AsJsonRepresentations

  representation :basic do
    {
      id: id,
      title: title,
      description: description,
      start_date: start_date.strftime('%Y-%m-%d'),
      end_date: end_date.strftime('%Y-%m-%d')
    }
  end
end
