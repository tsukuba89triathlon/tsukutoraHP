$('[data-role="division_select"]').html(escape_javascript(options_for_select(@divisions.map{|c| [c.div,c.id]})));
