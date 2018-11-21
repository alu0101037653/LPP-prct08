require 'spec_helper'


RSpec.describe Valoracion::Nutricion do
  before :each do
    @nut1 = Valoracion::Nutricion1.new("Zac Efron",70.0,1.78,65.0,90.0,1)
    @nut2 = Valoracion::Nutricion2.new("Miley Cyrus",80.0,1.8,75.0,95.0,0)
    @nut3 = Valoracion::Nutricion3.new("Tom Holland",65.0,1.7,60.0,90.0,0)
    @nut4 = Valoracion::Nutricion4.new("Ross Lynch",75.0,1.68,70.0,95.0,1)
    @nut5 = Valoracion::Nutricion5.new("Cole Sprouse",79.0,1.65,80.0,85.0,1)

    @nodo1 = Node.new(@nut1,nil,nil)
		@nodo2 = Node.new(@nut2,nil,nil)
		@nodo3 = Node.new(@nut3,nil,nil)
		@nodo4 = Node.new(@nut4,nil,nil)
    @nodo5 = Node.new(@nu5,nil,nil)
    
    @l = Valoracion::List.new()
  end

  

  describe "herencia" do
    it "La clase Nutricion1 es hija de Nutricion" do
      expect(@nut1).to be_kind_of(Valoracion::Nutricion)
    end

    it "La clase Nutricion2 es hija de Nutricion" do
      expect(@nut2).to be_kind_of(Valoracion::Nutricion)
    end

    it "La clase Nutricion3 es hija de Nutricion" do
      expect(@nut3).to be_kind_of(Valoracion::Nutricion)
    end

    it "La clase Nutricion4 es hija de Nutricion" do
      expect(@nut4).to be_kind_of(Valoracion::Nutricion)
    end

    it "La clase Nutricion5 es hija de Nutricion" do
      expect(@nut4).to be_kind_of(Valoracion::Nutricion)
    end
  end


  describe "List" do

		it "Se puede insertar un elemento por el Head" do
			@nut1 = Valoracion::Nutricion.new("Zac Efron",70.0,1.78,65.0,90.0,1)
		  @l = Valoracion::List.new()
		  @l.push_start(@nut1)
		end

		it "Se puede insertar un elemento por el Tail" do
			@l.push_end(@nut3)
		end

		it "Se pueden insertar varios elementos" do
			@l.push_start(@nut2)
		  @l.push_start(@nut1)
		  @l.push_end(@nut3)
		  @l.push_end(@nut4)
		  @l.push_end(@nut5)
		  expect(@l.get_size()).to eq(5)

		end

		it "Se puede extraer el primer elemento de la lista" do
			@l.push_start(@nut1)
			@l.push_end(@nut5)
			@l.pop_start()
		end

		it "Se puede extraer el ultimo elemento de la lista" do
			@l.push_start(@nut1)
			@l.push_end(@nut5)
			@l.pop_end()
    end

    it "Clasificacion de individuos segun su IMC" do
			@l.push_start(@nut1)
			@l.push_start(@nut2)
			@l.push_start(@nut3)
			@l.push_start(@nut4)
			@l.push_start(@nut5)
			expect(@l.Head.value.masacorporal).to eq(29.02)
		  expect(@l.Head.next.value.masacorporal).to eq(26.57)
		  expect(@l.Head.next.next.value.masacorporal).to eq(22.49)
		  expect(@l.Tail.prev.value.masacorporal).to eq(24.69)
		  expect(@l.Tail.value.masacorporal).to eq(22.09)
			@l.push_end(@nut1)
			@l.push_end(@nut2)
			@l.push_end(@nut3)
			@l.push_end(@nut4)
			@l.push_end(@nut5)
    end
    
    it "Clasificacion de individuos segun si tienen obesidad" do
			@l.push_start(@nut1)
			@l.push_start(@nut2)
			@l.push_start(@nut3)
			@l.push_start(@nut4)
			@l.push_start(@nut5)
			expect(@l.Head.value.masacorporal >= 30.0).to eq(false)
		  expect(@l.Head.next.value.masacorporal >= 30.0).to eq(false)
		  expect(@l.Head.next.next.value.masacorporal  >= 30.0).to eq(false)
		  expect(@l.Tail.prev.value.masacorporal  >= 30.0).to eq(false)
		  expect(@l.Tail.value.masacorporal  >= 30.0).to eq(false)
			@l.push_end(@nut1)
			@l.push_end(@nut2)
			@l.push_end(@nut3)
			@l.push_end(@nut4)
			@l.push_end(@nut5)
		end
  end
end


RSpec.describe Valoracion::Nutricion1 do
  before :each do
    @nut1 = Valoracion::Nutricion1.new("Zac Efron",70.0,1.78,65.0,90.0,1)
    @n2 = Valoracion::Nutricion1.new("Alex Petyffer",70.0,1.78,65.0,90.0,1)
    @n3 = Valoracion::Nutricion1.new("Demi Lovato",70.0,1.78,65.0,90.0,1)
    @n4 = Valoracion::Nutricion1.new("Selena Gomez",70.0,1.78,65.0,90.0,1)
    @n5 = Valoracion::Nutricion1.new("Dylan Efron",70.0,1.78,65.0,90.0,1)
  end

  describe "Valoracion" do
    it "Debe existir un metodo para obtener el nombre" do
      expect(@nut1.nom).to eq("Zac Efron")
      expect(@n2.nom).to eq("Alex Petyffer")
      expect(@n3.nom).to eq("Demi Lovato")
      expect(@n4.nom).to eq("Selena Gomez")
      expect(@n5.nom).to eq("Dylan Efron")
    end

    it "Debe existir un metodo para obtener el peso" do
      expect(@nut1.peso).to eq(70.0)
      expect(@n2.peso).to eq(70.0)
      expect(@n3.peso).to eq(70.0)
      expect(@n4.peso).to eq(70.0)
      expect(@n5.peso).to eq(70.0)
    end

    it "Debe existir un metodo para obtener la altura" do
      expect(@nut1.al).to eq(1.78)
      expect(@n2.al).to eq(1.78)
      expect(@n3.al).to eq(1.78)
      expect(@n4.al).to eq(1.78)
      expect(@n5.al).to eq(1.78)
    end

    it "Debe existir un metodo para obtener la cintura" do
      expect(@nut1.cin).to eq(65.0)
      expect(@n2.cin).to eq(65.0)
      expect(@n3.cin).to eq(65.0)
      expect(@n4.cin).to eq(65.0)
      expect(@n5.cin).to eq(65.0)
    end

    it "Debe existir un metodo para obtener la cadera" do
      expect(@nut1.ca).to eq(90.0)
      expect(@n2.ca).to eq(90.0)
      expect(@n3.ca).to eq(90.0)
      expect(@n4.ca).to eq(90.0)
      expect(@n5.ca).to eq(90.0)
    end
  end

  describe "Comprobaciones de tipo" do
    it "El nombre debe ser un string" do
      expect(@nut1.nom).to be_a(String)
    end

    it "El peso debe ser un numero" do
      expect(@nut1.peso).to be_a(Numeric)
    end

    it "La altura debe ser un numero" do
      expect(@nut1.al).to be_a(Numeric)
    end

    it "La cintura debe ser un numero" do
      expect(@nut1.cin).to be_a(Numeric)
    end

    it "La cadera debe ser un numero" do
      expect(@nut1.ca).to be_a(Numeric)
    end
  end
end

RSpec.describe Valoracion::Nutricion2 do
  before :each do
    @nut2 = Valoracion::Nutricion2.new("Lili Reinhart",70.0,1.78,65.0,90.0,1)
    @a2 = Valoracion::Nutricion2.new("KJ Apa",70.0,1.78,65.0,90.0,1)
    @a3 = Valoracion::Nutricion2.new("Camila Mendes",70.0,1.78,65.0,90.0,1)
    @a4 = Valoracion::Nutricion2.new("Millie Brown",70.0,1.78,65.0,90.0,1)
    @a5 = Valoracion::Nutricion2.new("Noah Schannp",70.0,1.78,65.0,90.0,1)
  end

  describe "Valoracion" do
    it "Debe existir un metodo para obtener el nombre" do
      expect(@nut2.nom).to eq("Lili Reinhart")
      expect(@a2.nom).to eq("KJ Apa")
      expect(@a3.nom).to eq("Camila Mendes")
      expect(@a4.nom).to eq("Millie Brown")
      expect(@a5.nom).to eq("Noah Schannp")
    end

    it "Debe existir un metodo para obtener el peso" do
      expect(@nut2.peso).to eq(70.0)
      expect(@a2.peso).to eq(70.0)
      expect(@a3.peso).to eq(70.0)
      expect(@a4.peso).to eq(70.0)
      expect(@a5.peso).to eq(70.0)
    end

    it "Debe existir un metodo para obtener la altura" do
      expect(@nut2.al).to eq(1.78)
      expect(@a2.al).to eq(1.78)
      expect(@a3.al).to eq(1.78)
      expect(@a4.al).to eq(1.78)
      expect(@a5.al).to eq(1.78)
    end

    it "Debe existir un metodo para obtener la cintura" do
      expect(@nut2.cin).to eq(65.0)
      expect(@a2.cin).to eq(65.0)
      expect(@a3.cin).to eq(65.0)
      expect(@a4.cin).to eq(65.0)
      expect(@a5.cin).to eq(65.0)
    end

    it "Debe existir un metodo para obtener la cadera" do
      expect(@nut2.ca).to eq(90.0)
      expect(@a2.ca).to eq(90.0)
      expect(@a3.ca).to eq(90.0)
      expect(@a4.ca).to eq(90.0)
      expect(@a5.ca).to eq(90.0)
    end
  end

  describe "Comprobaciones de tipo" do
    it "El nombre debe ser un string" do
      expect(@nut2.nom).to be_a(String)
    end

    it "El peso debe ser un numero" do
      expect(@nut2.peso).to be_a(Numeric)
    end

    it "La altura debe ser un numero" do
      expect(@nut2.al).to be_a(Numeric)
    end

    it "La cintura debe ser un numero" do
      expect(@nut2.cin).to be_a(Numeric)
    end

    it "La cadera debe ser un numero" do
      expect(@nut2.ca).to be_a(Numeric)
    end
  end
end

RSpec.describe Valoracion::Nutricion3 do
  before :each do
    @nut3 = Valoracion::Nutricion3.new("Lili Reinhart",70.0,1.78,65.0,90.0,1)
    @a2 = Valoracion::Nutricion3.new("KJ Apa",70.0,1.78,65.0,90.0,1)
    @a3 = Valoracion::Nutricion3.new("Camila Mendes",70.0,1.78,65.0,90.0,1)
    @a4 = Valoracion::Nutricion3.new("Millie Brown",70.0,1.78,65.0,90.0,1)
    @a5 = Valoracion::Nutricion3.new("Noah Schannp",70.0,1.78,65.0,90.0,1)
  end

  describe "Valoracion" do
    it "Debe existir un metodo para obtener el nombre" do
      expect(@nut3.nom).to eq("Lili Reinhart")
      expect(@a2.nom).to eq("KJ Apa")
      expect(@a3.nom).to eq("Camila Mendes")
      expect(@a4.nom).to eq("Millie Brown")
      expect(@a5.nom).to eq("Noah Schannp")
    end

    it "Debe existir un metodo para obtener el peso" do
      expect(@nut3.peso).to eq(70.0)
      expect(@a2.peso).to eq(70.0)
      expect(@a3.peso).to eq(70.0)
      expect(@a4.peso).to eq(70.0)
      expect(@a5.peso).to eq(70.0)
    end

    it "Debe existir un metodo para obtener la altura" do
      expect(@nut3.al).to eq(1.78)
      expect(@a2.al).to eq(1.78)
      expect(@a3.al).to eq(1.78)
      expect(@a4.al).to eq(1.78)
      expect(@a5.al).to eq(1.78)
    end

    it "Debe existir un metodo para obtener la cintura" do
      expect(@nut3.cin).to eq(65.0)
      expect(@a2.cin).to eq(65.0)
      expect(@a3.cin).to eq(65.0)
      expect(@a4.cin).to eq(65.0)
      expect(@a5.cin).to eq(65.0)
    end

    it "Debe existir un metodo para obtener la cadera" do
      expect(@nut3.ca).to eq(90.0)
      expect(@a2.ca).to eq(90.0)
      expect(@a3.ca).to eq(90.0)
      expect(@a4.ca).to eq(90.0)
      expect(@a5.ca).to eq(90.0)
    end
  end

  describe "Comprobaciones de tipo" do
    it "El nombre debe ser un string" do
      expect(@nut3.nom).to be_a(String)
    end

    it "El peso debe ser un numero" do
      expect(@nut3.peso).to be_a(Numeric)
    end

    it "La altura debe ser un numero" do
      expect(@nut3.al).to be_a(Numeric)
    end

    it "La cintura debe ser un numero" do
      expect(@nut3.cin).to be_a(Numeric)
    end

    it "La cadera debe ser un numero" do
      expect(@nut3.ca).to be_a(Numeric)
    end
  end
end

RSpec.describe Valoracion::Nutricion4 do
  before :each do
    @nut4 = Valoracion::Nutricion4.new("Lili Reinhart",70.0,1.78,65.0,90.0,1)
    @a2 = Valoracion::Nutricion4.new("KJ Apa",70.0,1.78,65.0,90.0,1)
    @a3 = Valoracion::Nutricion4.new("Camila Mendes",70.0,1.78,65.0,90.0,1)
    @a4 = Valoracion::Nutricion4.new("Millie Brown",70.0,1.78,65.0,90.0,1)
    @a5 = Valoracion::Nutricion4.new("Noah Schannp",70.0,1.78,65.0,90.0,1)
  end

  describe "Valoracion" do
    it "Debe existir un metodo para obtener el nombre" do
      expect(@nut4.nom).to eq("Lili Reinhart")
      expect(@a2.nom).to eq("KJ Apa")
      expect(@a3.nom).to eq("Camila Mendes")
      expect(@a4.nom).to eq("Millie Brown")
      expect(@a5.nom).to eq("Noah Schannp")
    end

    it "Debe existir un metodo para obtener el peso" do
      expect(@nut4.peso).to eq(70.0)
      expect(@a2.peso).to eq(70.0)
      expect(@a3.peso).to eq(70.0)
      expect(@a4.peso).to eq(70.0)
      expect(@a5.peso).to eq(70.0)
    end

    it "Debe existir un metodo para obtener la altura" do
      expect(@nut4.al).to eq(1.78)
      expect(@a2.al).to eq(1.78)
      expect(@a3.al).to eq(1.78)
      expect(@a4.al).to eq(1.78)
      expect(@a5.al).to eq(1.78)
    end

    it "Debe existir un metodo para obtener la cintura" do
      expect(@nut4.cin).to eq(65.0)
      expect(@a2.cin).to eq(65.0)
      expect(@a3.cin).to eq(65.0)
      expect(@a4.cin).to eq(65.0)
      expect(@a5.cin).to eq(65.0)
    end

    it "Debe existir un metodo para obtener la cadera" do
      expect(@nut4.ca).to eq(90.0)
      expect(@a2.ca).to eq(90.0)
      expect(@a3.ca).to eq(90.0)
      expect(@a4.ca).to eq(90.0)
      expect(@a5.ca).to eq(90.0)
    end
  end

  describe "Comprobaciones de tipo" do
    it "El nombre debe ser un string" do
      expect(@nut4.nom).to be_a(String)
    end

    it "El peso debe ser un numero" do
      expect(@nut4.peso).to be_a(Numeric)
    end

    it "La altura debe ser un numero" do
      expect(@nut4.al).to be_a(Numeric)
    end

    it "La cintura debe ser un numero" do
      expect(@nut4.cin).to be_a(Numeric)
    end

    it "La cadera debe ser un numero" do
      expect(@nut4.ca).to be_a(Numeric)
    end
  end
end

RSpec.describe Valoracion::Nutricion5 do
  before :each do
    @nut5 = Valoracion::Nutricion5.new("Lili Reinhart",70.0,1.78,65.0,90.0,1)
    @a2 = Valoracion::Nutricion5.new("KJ Apa",70.0,1.78,65.0,90.0,1)
    @a3 = Valoracion::Nutricion5.new("Camila Mendes",70.0,1.78,65.0,90.0,1)
    @a4 = Valoracion::Nutricion5.new("Millie Brown",70.0,1.78,65.0,90.0,1)
    @a5 = Valoracion::Nutricion5.new("Noah Schannp",70.0,1.78,65.0,90.0,1)
  end

  describe "Valoracion" do
    it "Debe existir un metodo para obtener el nombre" do
      expect(@nut5.nom).to eq("Lili Reinhart")
      expect(@a2.nom).to eq("KJ Apa")
      expect(@a3.nom).to eq("Camila Mendes")
      expect(@a4.nom).to eq("Millie Brown")
      expect(@a5.nom).to eq("Noah Schannp")
    end

    it "Debe existir un metodo para obtener el peso" do
      expect(@nut5.peso).to eq(70.0)
      expect(@a2.peso).to eq(70.0)
      expect(@a3.peso).to eq(70.0)
      expect(@a4.peso).to eq(70.0)
      expect(@a5.peso).to eq(70.0)
    end

    it "Debe existir un metodo para obtener la altura" do
      expect(@nut5.al).to eq(1.78)
      expect(@a2.al).to eq(1.78)
      expect(@a3.al).to eq(1.78)
      expect(@a4.al).to eq(1.78)
      expect(@a5.al).to eq(1.78)
    end

    it "Debe existir un metodo para obtener la cintura" do
      expect(@nut5.cin).to eq(65.0)
      expect(@a2.cin).to eq(65.0)
      expect(@a3.cin).to eq(65.0)
      expect(@a4.cin).to eq(65.0)
      expect(@a5.cin).to eq(65.0)
    end

    it "Debe existir un metodo para obtener la cadera" do
      expect(@nut5.ca).to eq(90.0)
      expect(@a2.ca).to eq(90.0)
      expect(@a3.ca).to eq(90.0)
      expect(@a4.ca).to eq(90.0)
      expect(@a5.ca).to eq(90.0)
    end
  end

  describe "Comprobaciones de tipo" do
    it "El nombre debe ser un string" do
      expect(@nut5.nom).to be_a(String)
    end

    it "El peso debe ser un numero" do
      expect(@nut5.peso).to be_a(Numeric)
    end

    it "La altura debe ser un numero" do
      expect(@nut5.al).to be_a(Numeric)
    end

    it "La cintura debe ser un numero" do
      expect(@nut5.cin).to be_a(Numeric)
    end

    it "La cadera debe ser un numero" do
      expect(@nut5.ca).to be_a(Numeric)
    end
  end
end
