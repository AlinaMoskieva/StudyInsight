class CurriculumsController < ApplicationController
  expose :curriculum
  expose :curriculums, -> { department.curriculums }

  expose :department
  expose :disciplines, -> { curriculum.disciplines }
  expose :custom_sections, -> { curriculum.custom_sections }
  expose :custom_attributes, -> { curriculum.custom_attributes }
  

  def create
    curriculum.department = department

    if curriculum.save
      redirect_to curriculum, notice: "Учебный план был успешно создан"
    else
      render :new
    end
  end

  def update
    if curriculum.update(curriculum_params)
      redirect_to curriculum, notice: "Учебный план был успешно обновлен"
    else
      render :edit
    end
  end

  def destroy
    curriculum.destroy
    redirect_to curriculum.department, notice: "Учебный план был успешно удален"
  end

  private

  def curriculum_params
    params.require(:curriculum).permit(:name, :year, 
      custom_sections_attributes: [:id, :name, :value, :_destroy,
        custom_section_units_attributes: [:id, :name, :value, :_destroy,
          custom_attributes_attributes: [:id, :name, :value, :_destroy]
        ],
        custom_attributes_attributes: [:id, :name, :value, :_destroy]
      ],
      custom_attributes_attributes: [:id, :name, :value, :_destroy]
    )
  end
end
