library(mtconnectR)

# Device XML
file_path_xml = "../data/adapter_logs/nist_test_bed/Devices.xml"
device_name = get_device_info_from_xml(file_path_xml)$name[2]

# Adapter log dataset

file_path_adapter_log = "../data/adapter_logs/nist_test_bed/GF_Agie_HPM600U-02NOV2015"
adapter_log_data = read_adapter_log_file(file_path_adapter_log, device_name)

# mtc_device
mtc_device = create_mtc_device_from_adapter_data(file_path_adapter_log, file_path_xml, device_name)

merged_data = merge(mtc_device)
names(merged_data) = extract_param_from_xpath(names(merged_data))

unique(adapter_log_data$data_item_name)
