require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
    img = Base64.encode64(File.open(Rails.root.join("test", "fixtures", "files", "neutral-face.png"), "rb").read)


  end

  test "should get index" do
    get images_url
    assert_response :success
  end

  test "should get new" do
    get new_image_url
    assert_response :success
  end

  test "should create image" do

    assert_difference('Image.count') do
      img =  "data:image/png;base64," + Base64.encode64(File.open(Rails.root.join("test","fixtures", "files", "neutral-face.png" ), "rb").read)


      post images_url, params: { image: { height: @image.height, name: @image.name, width: @image.width, x_position: @image.x_position, y_position: @image.y_position}, base64img: img }
    end

    assert_redirected_to image_url(Image.last)
  end

  test "should show image" do
    get image_url(@image)
    assert_response :success
  end


  test "should destroy image" do
    assert_difference('Image.count', -1) do
      delete image_url(@image)
    end

    assert_redirected_to images_url
  end


end
