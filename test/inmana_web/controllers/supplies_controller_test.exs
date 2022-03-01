defmodule InmanaWeb.SuppliesControllerTest do
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, returns success", %{conn: conn} do
      restaurant_params = %{name: "Siri Cascudo", email: "siri@cascudo.com"}

      %{"restaurant" => restaurant} =
        conn
        |> post(Routes.restaurants_path(conn, :create, restaurant_params))
        |> json_response(:created)

      %{"id" => restaurant_id} = restaurant

      supplies_params = %{
        restaurant_id: restaurant_id,
        description: "Maionese",
        responsible: "Marília",
        expiration_date: "2022-02-25"
      }

      response =
        conn
        |> post(Routes.supplies_path(conn, :create, supplies_params))
        |> json_response(:created)

      assert %{
               "message" => "Supply created!",
               "supply" => %{
                 "description" => "Maionese",
                 "expiration_date" => "2022-02-25",
                 "id" => _id,
                 "responsible" => "Marília",
                 "restaurant_id" => ^restaurant_id
               }
             } = response

      # assert id = response

      # response =
      #   conn
      #   |> post(Routes.restaurants_path(conn, :create, params))
      #   |> json_response(:created)

      # assert response == "banana"
      # expected_response =
    end
  end
end
