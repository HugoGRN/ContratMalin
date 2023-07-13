class PublicsController < ApplicationController
    def home
        pdftk = PdfForms.new('/opt/homebrew/bin/pdftk')
        field_names = pdftk.get_field_names("public/contrat_template/collaboration.pdf")
        @names = field_names
    end
end
