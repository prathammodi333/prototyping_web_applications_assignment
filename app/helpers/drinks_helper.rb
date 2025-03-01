module DrinksHelper
    def drink_image_tag(drink)
        if drink["strDrinkThumb"].present?
          image_tag(drink["strDrinkThumb"], alt: drink["strDrink"], class: "img-fluid", style: "max-width: 100px;")
        else
          content_tag(:p, "No Image Available", class: "text-muted")
        end
      end
end