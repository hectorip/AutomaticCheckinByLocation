defmodule Boilerplate.VenueTest do
  use Boilerplate.ModelCase

  alias Boilerplate.Venue

  @valid_attrs %{address: "some content", description: "some content", lat: "120.5", long: "120.5", name: "some content", photo_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Venue.changeset(%Venue{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Venue.changeset(%Venue{}, @invalid_attrs)
    refute changeset.valid?
  end
end
