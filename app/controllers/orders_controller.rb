class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_header, only: [:create]

  # GET /orders
  # GET /orders.json
  # def index
  #   @orders = Order.all
  # end
  def index
      @search = Order.search do
      # fulltext '"84CYd601Dh0slEeJ ankur saini"' do
      # with(:average_rating, 3..5)
      # field_list [:tracker_hash,:system_id]
      fulltext(params[:search])
      facet(:average_rating) do
        row(1.0..2.0) do
          with(:average_rating, 1.0..2.0)
        end
        row(2.0..3.0) do
          with(:average_rating, 2.0..3.0)
        end
        row(3.0..4.0) do
          with(:average_rating, 3.0..4.0)
        end
        row(4.0..5.0) do
          with(:average_rating, 4.0..5.0)
        end
      end
      # fulltext params[:search] do
       # boost_fields :system_id => 2.0
        # boost(2.0) { with(:response, true) }
        # fields(:tracker_hash)
        # fields(:system_id, :tracker_hash => 2.0)
        # query_phrase_slop 1
     # end
      # with(:published_at).less_than(Time.zone.now)
      # facet(:publish_month)
      # with(:publish_month, params[:month]) if params[:month].present?
      # with(:response, false)

    end
    # @orders = @search.results
    ids = @search.hits.map(&:primary_key)
    # debugger
    if ids.present?
    @orders =  Order.where(:id => ids).order("field(id, #{ids.join(',')})").paginate(page: params[:page], per_page: 4)
    else
      @orders = Order.where(:id => ids).paginate(page: params[:page], per_page: 4)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new(system_id: Order.set_system_id)
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new( order_params )
    @order.system_id = Order.set_system_id
    respond_to do |format|
      if @order.save
        set_order_values(@order,params)
        route = 'https://private-3643a-orderlordapi.apiary-mock.com/api/v1/jobs'
        respose =  HTTParty.post(route, body: @body, :headers => @headers)
        parsed_response = respose.parsed_response.symbolize_keys!
        if 	parsed_response[:success] == "true"
          @order.tracker_hash = parsed_response[:tracker_hash]
          @order.save!
        end
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def set_order_values(order,params)
    @body =  {
        "order": {
            "ordering_system_id": order.system_id,
            "cancelled_at": "2012-12-02T14:30:09+08:00",
            "created_at": "2012-12-02T14:00:09+08:00",
            "delivery_time": "60",
            "feedback_url": "test.sk/feedback",
            "timed_order": "1",
            "expected_delivery_at": Time.now + 60.minutes ,
            "note": "need chopsticks, doorbell isnt working",
            "price": {
                "delivery_fee": 2.00,
                "sub_total": 144.00,
                "vat_total": 28.80,
                "discount_total": 0,
                "grand_total": 174.80
            },
            "venue": {
                "name": "Sushi Time, Apollo",
                "ordering_system_id": "id-of-restaurant-in-ordering-system"
            },
            "customer": {
                "first_name": params[:first_name],
                "last_name": params[:last_name],
                "mobile_phone": params[:mobile_number],
                "email": params[:email],
                "address": {
                    "line1": params[:line1],
                    "line2": params[:line2],
                    "number": params[:number],
                    "other": "Other address info",
                    "city": params[:city],
                    "postcode":params[:postcode],
                    "longitude": 43.1,
                    "latitude": 18.7
                }
            },
            "payment": {
                "type": "cash",
                "paid": "0"
            },
            "products": [
                {
                    "ordering_system_id": "id-of-product-1-in-ordering-system",
                    "name": "salmon",
                    "price_unit": 12.00,
                    "price_total": 24.00,
                    "price_tax": 1.4,
                    "tax": 13,
                    "quantity": 2
                },
                {
                    "ordering_system_id": "id-of-product-2-in-ordering-system",
                    "name": "tenderloin steak",
                    "price_unit": 120.00,
                    "price_total": 120.00,
                    "price_tax": 1.4,
                    "tax": 13,
                    "quantity": 1
                }
            ]
        }
    }.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.friendly.find(params[:id])
    end

    def set_header
      @headers = { 'Content-Type' => 'application/json', "token" => "1234567890", "password" => "klJKshhC7Yzshzuv", "Accept" => "application/json"}
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:system_id, :response, :tracker_hash)
    end
end
