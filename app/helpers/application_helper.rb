module ApplicationHelper
  def rowspan_calc(instances,attribute)
    variable = nil
    counts = []
    count = 0

    instances.each do |instance|
      if instance.send(attribute[0]).send(attribute[1]) != variable
        variable = instance.send(attribute[0]).send(attribute[1])
        counts << count
      end
      count = count + 1
    end
    counts << count
  end

  def rowspan_calc1(instances,attribute)
    variable = nil
    counts = []
    count = 0

    instances.each do |instance|
      if instance.send(attribute) != variable
        variable = instance.send(attribute)
        counts << count
      end
      count = count + 1
    end
    counts << count
  end
end
