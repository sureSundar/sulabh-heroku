module SulabhAddressesHelper
def render_link_to_address(sa)

link_to sa.address1, sulabh_address_path(sa), remote: true

end
end
